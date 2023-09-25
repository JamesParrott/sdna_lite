//sDNA software for spatial network analysis 
//Copyright (C) 2011-2019 Cardiff University

//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.

//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with this program.  If not, see <https://www.gnu.org/licenses/>.

#include "stdafx.h"
#include "calculation.h"
#include "prepareoperations.h"

Calculation* sDNACalculationFactory(char *name_cstr, char *config, Net *net,
									  int (__cdecl *set_progressor_callback)(float),
									  int (__cdecl *print_warning_callback)(const char*),
									  vector<shared_ptr<Table<float>>>* tables1d)
{
	string name(name_cstr);
	to_lower(name);
	if (name=="sdnaintegral")
		return new SDNAIntegralCalculation(net,config,
											set_progressor_callback, print_warning_callback, tables1d); 
	else if (name=="sdnaprepare")
	{
		assert(tables1d->size()==0);
		delete tables1d;
		return new PrepareOperation(net,config,
											print_warning_callback); 
	}
	else
		throw BadConfigException("Unknown calculation type: "+string(name));
}